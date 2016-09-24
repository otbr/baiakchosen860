//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//////////////////////////////////////////////////////////////////////

#ifndef __OTSERV_DEPOTLOCKER_H__
#define __OTSERV_DEPOTLOCKER_H__

#include "container.h"
#include "inbox.h"

class DepotLocker : public Container
{
	public:
		DepotLocker(uint16_t _type);
		~DepotLocker();

		DepotLocker* getDepotLocker() {return this;}
		const DepotLocker* getDepotLocker() const {return this;}

		void removeInbox(Inbox* inbox);

		//serialization
		Attr_ReadValue readAttr(AttrTypes_t attr, PropStream& propStream);

		uint32_t getDepotId() const;
		void setDepotId(int32_t depotId) {setAttribute("depotid", depotId);}

		//cylinder implementations
		ReturnValue __queryAdd(int32_t index, const Thing* thing, uint32_t count,
			uint32_t flags, Creature* actor = NULL) const;

		void postAddNotification(Creature* actor, Thing* thing, const Cylinder* oldParent, int32_t index, CylinderLink_t link = LINK_OWNER);
		void postRemoveNotification(Creature* actor, Thing* thing, const Cylinder* newParent, int32_t index, bool isCompleteRemoval, CylinderLink_t link = LINK_OWNER);

		//overrides
		bool canRemove() const {return false;}
};

inline uint32_t DepotLocker::getDepotId() const
{
	bool ok;
	int32_t v = getIntegerAttribute("depotid", ok);
	if(ok)
		return (uint32_t)v;

	return 0;
}

#endif

