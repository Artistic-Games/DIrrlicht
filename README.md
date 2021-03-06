[![Build Status](https://travis-ci.org/danyalzia/DIrrlicht.png?branch=master)](https://travis-ci.org/danyalzia/DIrrlicht)
[![Stories in Ready](https://badge.waffle.io/danyalzia/dirrlicht.png?label=ready&title=Ready)](https://waffle.io/danyalzia/dirrlicht)
[![Gitter chat](https://badges.gitter.im/danyalzia/DIrrlicht.png)](https://gitter.im/danyalzia/DIrrlicht)

DIrrlicht - D Bindings of Irrlicht Engine
=========================================================

Details
-------

DIrrlicht is the D Bindings and semi-port of Irrlicht 3D Graphics Engine which makes it possible to use Irrlicht Engine from D programming language. It copies the API of Irrlicht Engine, but in a way that makes sense in D.

There are some notable changes in API, mostly due to the library being designed for D. See [this](https://github.com/danyalzia/DIrrlicht/wiki/Changes-from-Irrlicht).

Status
------

It's in very early beta stage. Several functions still aren't wrapped. It is subject to API changes.

Checkout the [Road Map](https://github.com/danyalzia/DIrrlicht/wiki/Roadmap) for the list of things that still needs to be done.

Installation
------------

Clone the repository:

```
$ git clone git://github.com/danyalzia/DIrrlicht
```

DIrrlicht relies on CIrrlicht. Fortunately, it is already included as a submodule, just make sure to update submodules:

```
$ cd DIrrlicht
$ git submodule update --init
```

Note however that Irrlicht isn't provided with CIrrlicht, so you have to get that and compile shared library of CIrrlicht.

Once you compile shared library of CIrrlicht, you can add the dub package locally:
```
$ dub add-local .
```

Usage
-----

As DIrrlicht is based on Irrlicht, it tries to separate the implementation from user. You aren't supposed to directly instantiate several classes, but you access them through different managers. Following is the short example that can be used to test DIrrlicht, it shows the simple window with a black background that can be minimized, resized and closed:

--------------------------------------------
```D
import dirrlicht.all;

void main() {
    auto device = createDevice(DriverType.OpenGL, dimension2du(800,600));
    device.windowCaption = "DIrrlicht Test!";
    device.resizable = true;
    
    auto driver = device.videoDriver;
    while(device.run()) {
        driver.beginScene();
        driver.endScene();
    }
}
```

See [wiki](https://github.com/danyalzia/DIrrlicht/wiki/) for more usage and tutorials.

Contributing
------------

DIrrlicht at most time aims to be a community driven project. It needs your help to grow up. Any kind of help will be fully appreciated. Feel free to open issues, send pull requests or just send me an email. If you provide some good pull requests and moral support, you may be given the rights to commit directly.

Before making a commit, please try to adhere to the [coding style](https://github.com/danyalzias/DIrrlicht/blob/master/CONTRIBUTING.md) of DIrrlicht.

Unit Tests
----------

Unit Tests are being aggressively tested through Travis Cl on every push. It uses only those resources that are in repository. To run them offline, do `dub test`. You can pass an extra flag for other compilers (i.e. GDC and LDC) such as `--compiler gdc` and `--compiler ldc2`.

License
-------

It is released under permissive zlib license same as Irrlicht Engine.
