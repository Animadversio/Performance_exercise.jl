export DefaultArray

# To solve this problem, you'll have to improve the `struct` definition and modify/add constructors
struct DefaultArray{T, N} <: AbstractArray{T,N} 
    parentarray::Array{T,N}
    defaultvalue::T
end
# DefaultArray(parentarray::AbstractArray{T,N} , defaultvalue) where {N, T} = DefaultArray{eltype(parentarray), ndims(parentarray)}(parentarray, defaultvalue)
DefaultArray(parentarray::Array{T,N}, defaultvalue) where {T, N} = DefaultArray{T, N}(parentarray, convert(T,defaultvalue))
DefaultArray(parentarray::Array{T,N}, defaultvalue::Nothing) where {T, N} = DefaultArray{Union{Nothing, T}, N}(parentarray, convert(Union{Nothing,T},defaultvalue))
# DefaultArray(parentarray::AbstractArray{T, N}, defaultvalue) = DefaultArray{T, N}(parentarray, defaultvalue)
@inline Base.getindex(a::DefaultArray{T,N}, i::Int) where {T, N}   = checkbounds(Bool, a, i) ? a.parentarray[i] : a.defaultvalue
@inline Base.getindex(a::DefaultArray{T,N}, i::Vararg{Int,N}) where {N, T} = checkbounds(Bool, a, i...) ? a.parentarray[i...] : a.defaultvalue
Base.size(a::DefaultArray) = size(a.parentarray)
