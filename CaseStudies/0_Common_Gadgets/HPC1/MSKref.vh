function integer _ref_nrnd(input integer d);
begin
if (d==2 || d==3) _ref_nrnd = d-1;
else if (d==4 || d == 5) _ref_nrnd = d;
else if (d==6) _ref_nrnd = d+1;
else if (d==7) _ref_nrnd = d+2;
else if (d==8 || d==9) _ref_nrnd = d+3;
else if (d == 10) _ref_nrnd = d+5;
else if (d == 11) _ref_nrnd = d+6;
else if (d == 12) _ref_nrnd = d+8;
else if (d >= 13 && d <= 16) _ref_nrnd = 2*d;
end
endfunction

localparam ref_n_rnd = _ref_nrnd(d);