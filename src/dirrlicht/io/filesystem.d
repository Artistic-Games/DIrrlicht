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

module dirrlicht.io.filesystem;

import dirrlicht.irrlichtdevice;

import std.string;

class FileSystem {
    this(irr_IFileSystem* ptr) {
    	this.ptr = ptr;
    }
    
    void addFileArchive(string file) {
        irr_IFileSystem_addFileArchive(ptr, toStringz(file));
    }
    
    alias ptr this;
    irr_IFileSystem* ptr;
}

package extern (C):

struct irr_IFileSystem;
void irr_IFileSystem_addFileArchive(irr_IFileSystem* filesystem, const char* text);