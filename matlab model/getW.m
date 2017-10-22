function [ W ] = getW(lambda, E, B)
    W = E/(lambda*(1-B));
end

