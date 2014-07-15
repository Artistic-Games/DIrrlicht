/+++
 + Compile-time functions/macros/mixins
 +/
module dirrlicht.compileconfig;

version(DigitalMars)
    enum DigitalMars = true;
else
    enum DigitalMars = false;

version(GNU)
    enum GDC = true;
else
    enum GDC = false;

version(LDC)
    enum LDC = true;
else
    enum LDC = false;

void checkNull(T)(T name, int line = __LINE__) {
	assert(name !is null);
	assert(name.ptr != null);
}

enum TestPrerequisite =
`
    import std.stdio;
    import dirrlicht.all;
    
    writeln();
    writeln("=====================");
    writeln("TESTING ", __MODULE__);
    writeln(__TIME__);
    writeln("=====================");
    writeln();

    auto device = createDevice(DriverType.OpenGL, dimension2du(800,600));
	checkNull(device);

    auto driver = device.videoDriver;
    checkNull(driver);

    auto smgr = device.sceneManager;
    checkNull(smgr);

    auto gui = device.guiEnvironment;
    checkNull(gui);
`;
