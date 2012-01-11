/**
 * BigBlueButton open source conferencing system - http://www.bigbluebutton.org/
 *
 * Copyright (c) 2010 BigBlueButton Inc. and by respective authors (see below).
 *
 * This program is free software; you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free Software
 * Foundation; either version 2.1 of the License, or (at your option) any later
 * version.
 *
 * BigBlueButton is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along
 * with BigBlueButton; if not, see <http://www.gnu.org/licenses/>.
 * 
 */
package org.bigbluebutton.modules.userareadock.events
{
	import flash.events.Event;
	
	import org.bigbluebutton.common.IBbbModuleWindow;
	
	/**
	 * Dispatch this event with your IBbbModuleWindow instance attached to add the MDIWindow to the main canvas area of bbb-client.
	 * 
	 */	
	public class OpenUserAreaWindowEvent extends Event
	{
		/**
		 * The MDIWindow instance to show on the main canvas 
		 */		
		public var window:IBbbModuleWindow;
		
		public static const OPEN_USER_AREA_WINDOW_EVENT:String = 'OPEN_USER_AREA_WINDOW_EVENT';
		
		public function OpenUserAreaWindowEvent(type:String=OPEN_USER_AREA_WINDOW_EVENT, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}