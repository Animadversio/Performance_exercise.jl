export sequence_of_three, alternate_items

function sequence_of_three(start::T) where T
    out = Vector{T}()
    push!(out, start, start+1, start+2)
    return out
end

function alternate_items(nrepeats::Integer, item1::T, item2::T) where T
    out = Vector{T}() 
    for _ = 1:nrepeats           # _ is often used for a variable you'll not use again
        push!(out, item1, item2)
    end
    return out
end

"""This version supports missing values in it. but it will be slower...and result in non-concrete types. """
function alternate_items(nrepeats::Integer, item1::Union{Missing, T}, item2::Union{Missing, T}) where T
    out = Vector{Union{Missing, T}}() # Union{Missing, T}
    for _ = 1:nrepeats           # _ is often used for a variable you'll not use again
        push!(out, item1, item2)
    end
    return out
end
