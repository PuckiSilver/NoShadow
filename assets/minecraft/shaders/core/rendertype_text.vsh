#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler0;
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
    if (Color.xyz == vec3(78/255., 92/255., 36/255.) && Position.z == 0.03) {
        vertexColor = texelFetch(Sampler2, UV2 / 16, 0); // remove color from no shadow marker
    } else if (Color.xyz == vec3(19/255., 23/255., 9/255.) && Position.z == 0) {
        vertexColor = vec4(0); // remove shadow
    }
}
