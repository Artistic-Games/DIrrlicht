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

module dirrlicht.scene.meshwriterenums;

/// An enumeration for all supported types of built-in mesh writers
/** A scene mesh writers is represented by a four character code
such as 'irrm' or 'coll' instead of simple numbers, to avoid
name clashes with external mesh writers.*/
enum WriterType
{
    /// Irrlicht native mesh writer, for static .irrmesh files.
    IrrMesh,

    /// COLLADA mesh writer for .dae and .xml files
    COLLADA,

    /// STL mesh writer for .stl files
    STL,

    /// OBJ mesh writer for .obj files
    OBJ,

    /// PLY mesh writer for .ply files
    PLY,
}


/// flags configuring mesh writing
enum MeshWriterFlags
{
    /// no writer flags
    None = 0,

    /// write lightmap textures out if possible
    WriteLightMaps = 0x1,

    /// write in a way that consumes less disk space
    WriteCompressed = 0x2,

    /// write in binary format rather than text
    WriteBinary = 0x4
}
