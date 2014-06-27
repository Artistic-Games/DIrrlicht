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

module dirrlicht.scene.ISceneNode;

import dirrlicht.scene.ISceneNodeAnimator;
import dirrlicht.scene.ISceneManager;
import dirrlicht.core.list;
import dirrlicht.core.vector3d;
import dirrlicht.video.EMaterialFlags;
import dirrlicht.video.EMaterialTypes;
import dirrlicht.video.ITexture;
import dirrlicht.scene.ISceneNodeAnimator;
import dirrlicht.video.SMaterial;
import dirrlicht.scene.ITriangleSelector;
import dirrlicht.scene.ESceneNodeTypes;
import dirrlicht.io.IAttributes;
import dirrlicht.io.IAttributeExchangingObject;

class ISceneNode
{
    this() {}

    void addAnimator(ISceneNodeAnimator animator)
    {
        auto animptr = cast(irr_ISceneNodeAnimator*)(animator);
        irr_ISceneNode_addAnimator(ptr, animptr);
    }

    void removeAnimator(ISceneNodeAnimator animator)
    {
        auto animptr = cast(irr_ISceneNodeAnimator*)(animator);
        irr_ISceneNode_removeAnimator(ptr, animptr);
    }

    void removeAnimators()
    {
        irr_ISceneNode_removeAnimators(ptr);
    }

    SMaterial getMaterial(uint num)
    {
        SMaterial mat = new SMaterial(this, num);
        return cast(SMaterial)(mat);
    }

    void setMaterialFlag(E_MATERIAL_FLAG flag, bool newvalue)
    {
        irr_ISceneNode_setMaterialFlag(ptr, flag, newvalue);
    }

    void setMaterialTexture(int n, ITexture texture)
    {
        irr_ISceneNode_setMaterialTexture(ptr, n, texture.ptr);
    }

    void setMaterialType(E_MATERIAL_TYPE newType)
    {
        irr_ISceneNode_setMaterialType(ptr, newType);
    }

    vector3df getScale()
    {
        auto temp = irr_ISceneNode_getScale(ptr);
        auto scale = vector3df(temp.x, temp.y, temp.z);
        return scale;
    }

    void setScale(vector3df scale)
    {
        irr_vector3df temp = {scale.x, scale.y, scale.z};
        irr_ISceneNode_setScale(ptr, temp);
    }

    vector3df getRotation()
    {
        auto temp = irr_ISceneNode_getRotation(ptr);
        auto rot = vector3df(temp.x, temp.y, temp.z);
        return rot;
    }

    void setRotation(vector3df rotation)
    {
        irr_vector3df temp = {rotation.x, rotation.y, rotation.z};
        irr_ISceneNode_setRotation(ptr, temp);
    }

    vector3df getPosition()
    {
        auto temp = irr_ISceneNode_getPosition(ptr);
        auto pos = vector3df(temp.x, temp.y, temp.z);
        return pos;
    }

    void setPosition(vector3df pos)
    {
        irr_vector3df temp = {pos.x, pos.y, pos.z};
        irr_ISceneNode_setPosition(ptr, temp);
    }

    vector3df getAbsolutePosition()
    {
        auto temp = irr_ISceneNode_getAbsolutePosition(ptr);
        auto pos = vector3df(temp.x, temp.y, temp.z);
        return pos;
    }

    void setAutomaticCulling(uint state)
    {
        irr_ISceneNode_setAutomaticCulling(ptr, state);
    }

    uint getAutomaticCulling()
    {
        return irr_ISceneNode_getAutomaticCulling(ptr);
    }

    void setDebugDataVisible(uint state)
    {
        irr_ISceneNode_setDebugDataVisible(ptr, state);
    }

    uint isDebugDataVisible()
    {
        return irr_ISceneNode_isDebugDataVisible(ptr);
    }

    void setIsDebugObject(bool debugObject)
    {
        irr_ISceneNode_setIsDebugObject(ptr, debugObject);
    }

    bool isDebugObject()
    {
        return irr_ISceneNode_isDebugObject(ptr);
    }

    void setParent(ISceneNode newParent)
    {
        irr_ISceneNode_setParent(ptr, cast(irr_ISceneNode*)newParent);
    }

    ITriangleSelector getTriangleSelector()
    {
        auto temp = cast(ITriangleSelector)irr_ISceneNode_getTriangleSelector(ptr);
        return temp;
    }

    void setTriangleSelector(ITriangleSelector selector)
    {
        irr_ISceneNode_setTriangleSelector(ptr, cast(irr_ITriangleSelector*)selector);
    }

    void updateAbsolutePosition()
    {
        irr_ISceneNode_updateAbsolutePosition(ptr);
    }

    ISceneNode getParent()
    {
        auto temp = cast(ISceneNode)irr_ISceneNode_getParent(ptr);
        return temp;
    }

    ESCENE_NODE_TYPE getType()
    {
        return irr_ISceneNode_getType(ptr);
    }

    ISceneManager getSceneManager()
    {
        return cast(ISceneManager)irr_ISceneNode_getSceneManager(ptr);
    }

    irr_ISceneNode* ptr;
private:
    ISceneManager smgr;
}

unittest
{
    import dirrlicht;
    import dirrlicht.video;
    import dirrlicht.scene;
    import dirrlicht.core;
    auto device = createDevice(E_DRIVER_TYPE.EDT_OPENGL, dimension2du(800,600));

    auto driver = device.getVideoDriver();
    auto smgr = device.getSceneManager();

    assert(smgr.smgr != null);

    auto mesh = smgr.getMesh("../../media/sydney.md2");
    assert(mesh.ptr != null);
    auto node = smgr.addAnimatedMeshSceneNode(mesh);

    assert(node.ptr != null);
    node.setMaterialFlag(E_MATERIAL_FLAG.EMF_LIGHTING, false);
}

extern (C):

struct irr_ISceneNode;

void irr_ISceneNode_addAnimator(irr_ISceneNode* node, irr_ISceneNodeAnimator* animator);
//irr_list* irr_ISceneNode_getAnimators(irr_ISceneNode* node);
void irr_ISceneNode_removeAnimator(irr_ISceneNode* node, irr_ISceneNodeAnimator* animator);
void irr_ISceneNode_removeAnimators(irr_ISceneNode* node);
ref irr_SMaterial* irr_ISceneNode_getMaterial(irr_ISceneNode* node, uint num);
uint irr_ISceneNode_getMaterialCount(irr_ISceneNode* node);
void irr_ISceneNode_setMaterialFlag(irr_ISceneNode* node, E_MATERIAL_FLAG flag, bool newvalue);
void irr_ISceneNode_setMaterialTexture(irr_ISceneNode* node, int c, irr_ITexture* texture);
void irr_ISceneNode_setMaterialType(irr_ISceneNode* node, E_MATERIAL_TYPE newType);
irr_vector3df irr_ISceneNode_getScale(irr_ISceneNode* node);
void irr_ISceneNode_setScale(irr_ISceneNode* node, irr_vector3df scale);
irr_vector3df irr_ISceneNode_getRotation(irr_ISceneNode* node);
void irr_ISceneNode_setRotation(irr_ISceneNode* node, irr_vector3df rotation);
irr_vector3df irr_ISceneNode_getPosition(irr_ISceneNode* node);
void irr_ISceneNode_setPosition(irr_ISceneNode* node, irr_vector3df newpos);
irr_vector3df irr_ISceneNode_getAbsolutePosition(irr_ISceneNode* node);
void irr_ISceneNode_setAutomaticCulling(irr_ISceneNode* node, uint state);
uint irr_ISceneNode_getAutomaticCulling(irr_ISceneNode* node);
void irr_ISceneNode_setDebugDataVisible(irr_ISceneNode* node, uint state);
uint irr_ISceneNode_isDebugDataVisible(irr_ISceneNode* node);
void irr_ISceneNode_setIsDebugObject(irr_ISceneNode* node, bool debugObject);
bool irr_ISceneNode_isDebugObject(irr_ISceneNode* node);
//irr_list* irr_ISceneNode_getChildren(irr_ISceneNode* node);
void irr_ISceneNode_setParent(irr_ISceneNode* node, irr_ISceneNode* newParent);
irr_ITriangleSelector* irr_ISceneNode_getTriangleSelector(irr_ISceneNode* node);
void irr_ISceneNode_setTriangleSelector(irr_ISceneNode* node, irr_ITriangleSelector* selector);
void irr_ISceneNode_updateAbsolutePosition(irr_ISceneNode* node);
irr_ISceneNode* irr_ISceneNode_getParent(irr_ISceneNode* node);
ESCENE_NODE_TYPE irr_ISceneNode_getType(irr_ISceneNode* node);
void irr_ISceneNode_serializeAttributes(irr_ISceneNode* node, irr_IAttributes*, irr_SAttributeReadWriteOptions*);
void irr_ISceneNode_deserializeAttributes(irr_ISceneNode* node, irr_IAttributes*, irr_SAttributeReadWriteOptions*);
irr_ISceneNode* irr_ISceneNode_clone(irr_ISceneNode* node, irr_ISceneNode*, irr_ISceneManager*);
irr_ISceneManager* irr_ISceneNode_getSceneManager(irr_ISceneNode* node);
