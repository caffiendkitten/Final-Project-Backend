class Api::V1::EncryptController < ApplicationController

    def encrypt(plain_text, key)
        cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').encrypt
        cipher.key = Digest::SHA1.hexdigest key
        s = cipher.update(plain_text) + cipher.final

        s.unpack('H*')[0].upcase
    end

    def decrypt(cipher_text, key)
        cipher = OpenSSL::Cipher.new('DES-EDE3-CBC').decrypt
        cipher.key = Digest::SHA1.hexdigest key
        s = [cipher_text].pack("H*").unpack("C*").pack("c*")

        cipher.update(s) + cipher.final
    end
end