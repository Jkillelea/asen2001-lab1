function m = magnitude(vector)
	% calculates the magnitude of the 3D vector a, b, c
	a = vector(1).^2; % square them all
	b = vector(2).^2;
	c = vector(3).^2;
	% fprintf('sqrt(%d)\n',(a+b+c));
	m = sqrt(a + b + c);
end
