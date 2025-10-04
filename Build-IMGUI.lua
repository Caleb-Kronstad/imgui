project "IMGUI"
    location "../../../Build/Build-Files"
    kind "StaticLib"
    language "C++"

    targetdir ("../../../Build/Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../../../Build/Binaries-Intermediate/" .. OutputDir .. "/%{prj.name}")

    includedirs {
        "%{IncludeDir.IMGUI}",
        "%{IncludeDir.GLAD}",
        "%{IncludeDir.GLFW}"
    }

    files {
        "*.cpp",
        "*.h",
        "misc/cpp/*.cpp",
        "misc/cpp/*.h",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_opengl3.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_opengl3.cpp"
    }

    defines {
        "IMGUI_IMPL_OPENGL_LOADER_GLAD"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"
        defines {
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter "system:linux"
        pic "On"
        staticruntime "On"

    filter "configurations:Debug"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"
