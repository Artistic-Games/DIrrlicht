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

module dirrlicht.scene.CVertexBuffer;

import dirrlicht.scene.IVertexBuffer;
import dirrlicht.scene.IMeshBuffer;
import dirrlicht.video.SMaterial;
import dirrlicht.core.aabbox3d;
import dirrlicht.video.EMaterialFlags;
import dirrlicht.scene.EHardwareBufferFlags;
import dirrlicht.video.SVertexIndex;
import dirrlicht.video.S3DVertex;

class CVertexBuffer : IVertexBuffer
{
    void* getData();
	E_VERTEX_TYPE getType();
	void setType(E_VERTEX_TYPE vertexType);
	uint stride();
	uint size();
	void push_back(S3DVertex element);

	//S3DVertex operator [](const uint index);

	S3DVertex getLast();
	void set_used(uint usedNow);
	void reallocate(uint new_size);
	uint allocated_size();
	S3DVertex* pointer();

	/// get the current hardware mapping hint
	E_HARDWARE_MAPPING getHardwareMappingHint();

	/// set the hardware mapping hint, for driver
	void setHardwareMappingHint(E_HARDWARE_MAPPING NewMappingHint);

	/// flags the meshbuffer as changed, reloads hardware buffers
	void setDirty();

	/// Get the currently used ID for identification of changes.
	/** This shouldn't be used for anything outside the VideoDriver. */
	uint getChangedID();

    interface IVertexList
    {
        uint stride();
        uint size();
        void push_back(uint element);
        //u32 operator [](u32 index);
        uint getLast();
        void setValue(uint index, uint value);
        void set_used(uint usedNow);
        void reallocate(uint new_size);
        uint allocated_size();
        void* pointer();
        E_VERTEX_TYPE getType();
    };

    this(E_VERTEX_TYPE vertexType)
    {
        Vertices = null;
        MappingHint = E_HARDWARE_MAPPING.EHM_NEVER;
        ChangedID = 1;
    }

    IVertexList *Vertices;
    E_HARDWARE_MAPPING MappingHint;
    uint ChangedID;
}
