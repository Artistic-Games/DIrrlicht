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

module dirrlicht.scene.terrainelements;

/// enumeration for patch sizes specifying the size of patches in the TerrainSceneNode
enum TerrainPatchSize
{
    /// patch size of 9, at most, use 4 levels of detail with this patch size.
    _9 = 9,

    /// patch size of 17, at most, use 5 levels of detail with this patch size.
    _17 = 17,

    /// patch size of 33, at most, use 6 levels of detail with this patch size.
    _33 = 33,

    /// patch size of 65, at most, use 7 levels of detail with this patch size.
    _65 = 65,

    /// patch size of 129, at most, use 8 levels of detail with this patch size.
    _129 = 129
}
