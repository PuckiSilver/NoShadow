#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform int FogShape;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

bool roughlyEquals(float a, float b) {
    return abs(a - b) < 0.01;
}

void main() {
    // vanilla behavior
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
    vertexDistance = fog_distance(Position, FogShape);
    vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    // NoShadow behavior (https://github.com/PuckiSilver/NoShadow)
    ivec3 iColor = ivec3(Color.xyz * 255 + vec3(0.5));
    if (iColor == ivec3(78, 92, 36) && (
        roughlyEquals(Position.z, 2200.03) || // Actionbar
        roughlyEquals(Position.z, 2400.06) || // Subtitle
        roughlyEquals(Position.z, 2400.12) || // Title
        roughlyEquals(Position.z, 51.03) ||   // Opened Chat
        roughlyEquals(Position.z, 2651.03) || // Closed Chat
        roughlyEquals(Position.z, 200.03) ||  // Advancement Screen
        roughlyEquals(Position.z, 400.03) ||  // Items
        roughlyEquals(Position.z, 1000.03) || // Bossbar
        roughlyEquals(Position.z, 2800.03) || // Scoreboard List
        roughlyEquals(Position.z, 2000)       // Scoreboard Sidebar (Has no shadow, remove tint for consistency)
        )) { // Regular text
        vertexColor.rgb = texelFetch(Sampler2, UV2 / 16, 0).rgb; // Remove color from no shadow marker
    } else if (iColor == ivec3(19, 23, 9) && (
        roughlyEquals(Position.z, 2200) || // Actionbar
        roughlyEquals(Position.z, 2400) || // Subtitle | Title
        roughlyEquals(Position.z, 51) ||   // Opened Chat
        roughlyEquals(Position.z, 2651) || // Closed Chat
        roughlyEquals(Position.z, 200) ||  // Advancement Screen
        roughlyEquals(Position.z, 400) ||  // Items
        roughlyEquals(Position.z, 1000) || // Bossbar
        roughlyEquals(Position.z, 2800)    // Scoreboard List
        )) { // Shadow
        gl_Position = vec4(2,2,2,1); // Move shadow off screen
    }
}
