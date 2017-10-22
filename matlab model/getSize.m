function [ count ] = getSize(K, N, n)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    count  = K+1;
    for i = 1:N-n(1)
        count = count + (K-n(i));
    end
end

