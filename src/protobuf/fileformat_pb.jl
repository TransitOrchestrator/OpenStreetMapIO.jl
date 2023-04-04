# Autogenerated using ProtoBuf.jl v1.0.9 on 2022-11-02T17:03:32.441
# original file: /home/jrklasen/dev/juliapkg/OpenStreetMapIO/src/protobuf/proto/fileformat.proto (proto2 syntax)

import ProtoBuf as PB
using ProtoBuf: OneOf
using ProtoBuf.EnumX: @enumx

export Blob, BlobHeader

struct Blob
    raw::Vector{UInt8}
    raw_size::Int32
    zlib_data::Vector{UInt8}
    lzma_data::Vector{UInt8}
    OBSOLETE_bzip2_data::Vector{UInt8}
end
PB.default_values(::Type{Blob}) =
    (; raw = UInt8[], raw_size = zero(Int32), zlib_data = UInt8[], lzma_data = UInt8[], OBSOLETE_bzip2_data = UInt8[])
PB.field_numbers(::Type{Blob}) = (; raw = 1, raw_size = 2, zlib_data = 3, lzma_data = 4, OBSOLETE_bzip2_data = 5)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:Blob})
    raw = UInt8[]
    raw_size = zero(Int32)
    zlib_data = UInt8[]
    lzma_data = UInt8[]
    OBSOLETE_bzip2_data = UInt8[]
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            raw = PB.decode(d, Vector{UInt8})
        elseif field_number == 2
            raw_size = PB.decode(d, Int32)
        elseif field_number == 3
            zlib_data = PB.decode(d, Vector{UInt8})
        elseif field_number == 4
            lzma_data = PB.decode(d, Vector{UInt8})
        elseif field_number == 5
            OBSOLETE_bzip2_data = PB.decode(d, Vector{UInt8})
        else
            PB.skip(d, wire_type)
        end
    end
    return Blob(raw, raw_size, zlib_data, lzma_data, OBSOLETE_bzip2_data)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::Blob)
    initpos = position(e.io)
    !isempty(x.raw) && PB.encode(e, 1, x.raw)
    x.raw_size != zero(Int32) && PB.encode(e, 2, x.raw_size)
    !isempty(x.zlib_data) && PB.encode(e, 3, x.zlib_data)
    !isempty(x.lzma_data) && PB.encode(e, 4, x.lzma_data)
    !isempty(x.OBSOLETE_bzip2_data) && PB.encode(e, 5, x.OBSOLETE_bzip2_data)
    return position(e.io) - initpos
end
function PB._encoded_size(x::Blob)
    encoded_size = 0
    !isempty(x.raw) && (encoded_size += PB._encoded_size(x.raw, 1))
    x.raw_size != zero(Int32) && (encoded_size += PB._encoded_size(x.raw_size, 2))
    !isempty(x.zlib_data) && (encoded_size += PB._encoded_size(x.zlib_data, 3))
    !isempty(x.lzma_data) && (encoded_size += PB._encoded_size(x.lzma_data, 4))
    !isempty(x.OBSOLETE_bzip2_data) && (encoded_size += PB._encoded_size(x.OBSOLETE_bzip2_data, 5))
    return encoded_size
end

struct BlobHeader
    var"#type"::String
    indexdata::Vector{UInt8}
    datasize::Int32
end
PB.default_values(::Type{BlobHeader}) = (; var"#type" = "", indexdata = UInt8[], datasize = zero(Int32))
PB.field_numbers(::Type{BlobHeader}) = (; var"#type" = 1, indexdata = 2, datasize = 3)

function PB.decode(d::PB.AbstractProtoDecoder, ::Type{<:BlobHeader})
    var"#type" = ""
    indexdata = UInt8[]
    datasize = zero(Int32)
    while !PB.message_done(d)
        field_number, wire_type = PB.decode_tag(d)
        if field_number == 1
            var"#type" = PB.decode(d, String)
        elseif field_number == 2
            indexdata = PB.decode(d, Vector{UInt8})
        elseif field_number == 3
            datasize = PB.decode(d, Int32)
        else
            PB.skip(d, wire_type)
        end
    end
    return BlobHeader(var"#type", indexdata, datasize)
end

function PB.encode(e::PB.AbstractProtoEncoder, x::BlobHeader)
    initpos = position(e.io)
    !isempty(x.var"#type") && PB.encode(e, 1, x.var"#type")
    !isempty(x.indexdata) && PB.encode(e, 2, x.indexdata)
    x.datasize != zero(Int32) && PB.encode(e, 3, x.datasize)
    return position(e.io) - initpos
end
function PB._encoded_size(x::BlobHeader)
    encoded_size = 0
    !isempty(x.var"#type") && (encoded_size += PB._encoded_size(x.var"#type", 1))
    !isempty(x.indexdata) && (encoded_size += PB._encoded_size(x.indexdata, 2))
    x.datasize != zero(Int32) && (encoded_size += PB._encoded_size(x.datasize, 3))
    return encoded_size
end
