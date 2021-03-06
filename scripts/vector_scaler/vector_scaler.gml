///@function vector_scaler Scales the vector to the distance specified
///@arg vector
///@arg scale

var v1 = vector_norm(argument0);
var scale = argument1;
var v;

var num = v1[0];
v[0] = num;

for(var i = 1; i <= num; i++) {
    v[i] = v1[i]*scale;
}

return v;