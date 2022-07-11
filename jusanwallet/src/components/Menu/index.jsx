import './menu.css';
import { AiFillHome, AiOutlineHistory, AiFillSetting } from 'react-icons/ai';
import { IoIosNotifications } from 'react-icons/io';
import { MdOutlineEditCalendar, MdAutorenew } from 'react-icons/md';


export function Menu() {
  return (
    <div className='Menu'>
      <a className='active' href='#home'>
        <AiFillHome/>
      </a>
      <a href='#history'><AiOutlineHistory /></a>
      <a href='#auto'><MdAutorenew /></a>
      <a href='#'><MdOutlineEditCalendar /></a>
      <a href='#'><IoIosNotifications /></a>
      <a href='#'><AiFillSetting /></a>

    </div>
  );
}

// export default Menu;
