local HashLib = {}
local bit = bit32 or require("bit")
local AND, OR, XOR, SHL, SHR = bit.band, bit.bor, bit.bxor, bit.lshift, bit.rshift
local ROL = function(x, n) return OR(SHL(x, n), SHR(x, 32-n)) end
local ROR = function(x, n) return OR(SHR(x, n), SHL(x, 32-n)) end

local K = {
    0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
    0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
    0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
    0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
    0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
    0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
    0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
    0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
}

local H0 = {0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19}

function HashLib.hex_to_bin(hex)
    if type(hex) ~= "string" then return "" end
    return (hex:gsub("..", function(cc) 
        return string.char(tonumber(cc, 16) or 0) 
    end))
end

function HashLib.sha256(data)
    data = tostring(data)
    if #data == 0 then data = "" end
    
    local byte, len = string.byte, #data
    
    local extra = 64 - ((len + 9) % 64)
    if extra == 64 then extra = 0 end
    
    local msg = data .. "\128" .. string.rep("\0", extra)
    
    local bits = len * 8
    for i = 56, 0, -8 do
        msg = msg .. string.char(bit.rshift(bits, i) % 256)
    end
    
    local H = {table.unpack(H0)}
    local W = {}
    
    for offset = 1, #msg, 64 do
        for i = 1, 16 do
            local pos = offset + (i-1)*4
            local b1, b2, b3, b4 = byte(msg, pos) or 0, byte(msg, pos+1) or 0, byte(msg, pos+2) or 0, byte(msg, pos+3) or 0
            W[i] = (b1 * 256^3) + (b2 * 256^2) + (b3 * 256) + b4
        end
        
        for i = 17, 64 do
            local s0 = XOR(ROR(W[i-15], 7), ROR(W[i-15], 18), SHR(W[i-15], 3))
            local s1 = XOR(ROR(W[i-2], 17), ROR(W[i-2], 19), SHR(W[i-2], 10))
            W[i] = (W[i-16] + s0 + W[i-7] + s1) % 4294967296
        end
        
        local a, b, c, d, e, f, g, h = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]
        
        for i = 1, 64 do
            local S1 = XOR(ROR(e, 6), ROR(e, 11), ROR(e, 25))
            local ch = XOR(AND(e, f), AND(-1 - e, g))
            local temp1 = (h + S1 + ch + K[i] + W[i]) % 4294967296
            
            local S0 = XOR(ROR(a, 2), ROR(a, 13), ROR(a, 22))
            local maj = XOR(AND(a, b), AND(a, c), AND(b, c))
            local temp2 = (S0 + maj) % 4294967296
            
            h = g
            g = f
            f = e
            e = (d + temp1) % 4294967296
            d = c
            c = b
            b = a
            a = (temp1 + temp2) % 4294967296
        end
        
        H[1] = (H[1] + a) % 4294967296
        H[2] = (H[2] + b) % 4294967296
        H[3] = (H[3] + c) % 4294967296
        H[4] = (H[4] + d) % 4294967296
        H[5] = (H[5] + e) % 4294967296
        H[6] = (H[6] + f) % 4294967296
        H[7] = (H[7] + g) % 4294967296
        H[8] = (H[8] + h) % 4294967296
    end
    local result = {}
    for i = 1, 8 do
        result[i] = string.format("%08x", H[i])
    end
    return table.concat(result)
end

function HashLib.hmac(hash_func, key, message)
    if hash_func ~= HashLib.sha256 then
        error("HMAC only supports sha256 in this minimal version", 2)
    end
    
    key = tostring(key or "")
    message = tostring(message or "")
    local block_size = 64
    
    if #key > block_size then
        key = HashLib.hex_to_bin(HashLib.sha256(key))
    end
    
    if #key < block_size then
        key = key .. string.rep("\0", block_size - #key)
    end
    
    local o_key_pad, i_key_pad = "", ""
    for i = 1, block_size do
        local k_byte = string.byte(key, i) or 0
        i_key_pad = i_key_pad .. string.char(XOR(k_byte, 0x36))
        o_key_pad = o_key_pad .. string.char(XOR(k_byte, 0x5c))
    end
    local inner = HashLib.sha256(i_key_pad .. message)
    inner = HashLib.hex_to_bin(inner)
    return HashLib.sha256(o_key_pad .. inner)
end
function HashLib.test()
    local test_str = "Hello World"
    local test_key = "secret"
    
    local hash = HashLib.sha256(test_str)
    local hmac = HashLib.hmac(HashLib.sha256, test_key, test_str)
    
    print("SHA256('" .. test_str .. "') = " .. hash)
    print("HMAC('" .. test_key .. "', '" .. test_str .. "') = " .. hmac)
    local expected_sha256 = "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e"
    if hash == expected_sha256 then
        print("✓ SHA256 test passed")
    else
        print("✗ SHA256 test failed")
    end
    return hash, hmac
end

return HashLib
