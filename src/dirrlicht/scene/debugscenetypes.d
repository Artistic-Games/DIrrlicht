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

module dirrlicht.scene.debugscenetypes;

/// An enumeration for all types of debug data for built-in scene nodes (flags)
enum DebugSceneType
{
    /// No Debug Data ( Default )
    Off = 0,

    /// Show Bounding Boxes of SceneNode
    BBox = 1,

    /// Show Vertex Normals
    Normals = 2,

    /// Shows Skeleton/Tags
    Skeleton = 4,

    /// Overlays Mesh Wireframe
    MeshWireOverlay = 8,

    /// Temporary use transparency Material Type
    HalfTransparency = 16,

    /// Show Bounding Boxes of all MeshBuffers
    BBoxBuffers = 32,

    /// EDS_BBOX | EDS_BBOX_BUFFERS
    BBoxAll = BBox | BBoxBuffers,

    /// Show all debug infos
    Full = 0xffffffff
}
