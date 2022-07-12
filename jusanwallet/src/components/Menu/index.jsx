import './menu.css';
import { AiFillHome, AiOutlineHistory, AiFillSetting } from 'react-icons/ai';
import { IoIosNotifications } from 'react-icons/io';
import { MdAutorenew } from 'react-icons/md';

export function Menu() {
  return (
    <div className='Menu'>
      <a className='active' id='homepage' href='./'>
        <AiFillHome />
      </a>
      <a href='/statistics' id='history'>
        <AiOutlineHistory />
      </a>
      <a href='./autopayment' id='autopayment'>
        <MdAutorenew />
      </a>
      <a href='#' id='noti'>
        <IoIosNotifications />
      </a>
      <a href='#' id='sett'>
        <AiFillSetting />
      </a>
    </div>
  );
}
