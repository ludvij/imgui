project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect"c++20"
	staticruntime "on"

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin/intermediates/" .. outputDir .. "/%{prj.name}")

	files {
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
		"misc/freetype/imgui_freetype.cpp",
		"misc/freetype/imgui_freetype.h",
		"misc/cpp/imgui_stdlib.cpp",
		"misc/cpp/imgui_stdlib.h"
	}


	includedirs {
		".",
		"%{IncludeDir.freetype}"
	}

	defines {
		"IMGUI_ENABLE_FREETYPE"
	}

	filter "system:windows"
		systemversion "latest"

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"


	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		symbols "off"

