function result = isequal_s(A, B, tol)
    result = all(all(abs(A - B) < tol));
end
