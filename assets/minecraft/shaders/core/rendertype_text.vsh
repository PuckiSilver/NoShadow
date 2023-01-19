#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {
    // vanilla behavior
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    // NoShadow behavior (https://github.com/PuckiSilver/NoShadow)
    if (Color.xyz == vec3(78/255., 92/255., 36/255.) && (Position.z == 0.03 || Position.z == 0.06 || Position.z == 0.12)) {
        vertexColor.rgb = texelFetch(Sampler2, UV2 / 16, 0).rgb; // remove color from no shadow marker
    } else if (Color.xyz == vec3(19/255., 23/255., 9/255.) && Position.z == 0) {
        gl_Position = vec4(2,2,2,1); // move shadow off screen
    }
}
