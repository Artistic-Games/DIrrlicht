/*
    DIrrlicht - D Bindings for Irrlicht Engine

    Copyright (C) 2014- Danyal Zia (catofdanyal@yahoo.com)

    This software is provided 'as-is', without any express or
    implied warranty. In no event will the authors be held
    liable for any damages arising from the use of this software.

    Permission is granted to anyone to use this software for any purpose,
    including commercial applications, and to alter it and redistribute
    it freely, subject to the following restrictions:

    1. The origin of this software must not be misrepresented;
       you must not claim that you wrote the original software.
       If you use this software in a product, an acknowledgment
       in the product documentation would be appreciated but
       is not required.

    2. Altered source versions must be plainly marked as such,
       and must not be misrepresented as being the original software.

    3. This notice may not be removed or altered from any
       source distribution.
*/

module dirrlicht.irrtypes;

/// creates four CC codes used in Irrlicht for simple ids
static uint MAKE_DIRR_ID(ubyte c0, ubyte c1, ubyte c2, ubyte c3) {
	return cast(uint)c0 | (cast(uint)c1 << 8) | 
		(cast(uint)c2 << 16) | (cast(uint)c3 << 24);
}

enum _IRR_MATERIAL_MAX_TEXTURES_ = 10;
enum IRRLICHT_SDK_VERSION = "1.9";
