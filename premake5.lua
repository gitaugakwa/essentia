project "Essentia"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs
	{
		"src",
		"src/algorithms",
		"src/essentia",
		"src/essentia/scheduler",
		"src/essentia/streaming",
		"src/essentia/streaming/algorithms",
		"src/essentia/utils",
		"../eigen",
		"src/3rdparty",
		"src/3rdparty/cephes",
		"src/3rdparty/kiss_fft130",
		"src/3rdparty/nnls",
		"src/3rdparty/spline",
		"src/3rdparty/tensorflow",
		"src/3rdparty/vamp-plugin-sdk-2.4",
		"packaging/win32_3rdparty/include",
		"packaging/win32_3rdparty/include/taglib",
	}

	files
	{
		"src/algorithms/**/*.cpp",
		-- "src/3rdparty/**/*.cpp",
		"src/3rdparty/spline/*.cpp",
		"src/3rdparty/nnls/*.c",
		"src/3rdparty/cephes/**/*.cpp",
		-- "src/3rdparty/nnls/*.cpp",
		"src/essentia/streaming/**/*.cpp",
		"src/essentia/streaming/*.cpp",
		"src/essentia/utils/*.cpp",
		"src/essentia/algorithm.cpp",
		"src/essentia/essentia.cpp",
		"src/algorithms/essentia_algorithms_reg.cpp",
		"src/essentia/connector.cpp",
		"src/essentia/debugging.cpp",
		"src/essentia/parameter.cpp",
		"src/essentia/range.cpp",
		"src/essentia/stringutil.cpp",
		"src/essentia/pool.cpp",
		"src/essentia/configurable.cpp",
		"src/essentia/scheduler/network.cpp",
		"src/essentia/streaming/sourcebase.cpp",
		"src/essentia/streaming/streamingalgorithm.cpp",
		"src/essentia/streaming/streamingalgorithmcomposite.cpp",
		"src/essentia/streaming/streamingalgorithmwrapper.cpp",
		"src/essentia/streaming/sinkbase.cpp",
		"src/**/*.h"
	}

	removefiles
	{
		"src/algorithms/highlevel/gaiatransform.*",
		"src/algorithms/machinelearning/*.*",
		"src/algorithms/standard/*ffta*.*",
		"src/algorithms/standard/*fftk*.*",
	}

	defines
	{
		"NOMINMAX",
		"_USE_MATH_DEFINES",
		"_HAS_STD_BYTE=0",
	}

	undefines
	{
	}

	links
	{
		"packaging/win32_3rdparty/lib/fftw3f.lib",
		"packaging/win32_3rdparty/lib/libfftw3f-3.dll",
		"packaging/win32_3rdparty/lib/avutil.lib",
		"packaging/win32_3rdparty/lib/avcodec.lib",
		"packaging/win32_3rdparty/lib/avformat.lib",
		"packaging/win32_3rdparty/lib/swresample.lib",
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"
		buildoptions {"/bigobj"}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"