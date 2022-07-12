import './menu.css';
import { AiFillHome, AiOutlineHistory, AiFillSetting } from 'react-icons/ai';
import { IoIosNotifications } from 'react-icons/io';
import { MdOutlineEditCalendar, MdAutorenew } from 'react-icons/md';
import Home from '../Home'


export function Menu() {
  return (
    <div className='Menu'>
      <a className='active links' id='homepage' href='./Home'>
        <AiFillHome/>
      </a>
      <a href='/Statistics' className='links' id='history'><AiOutlineHistory /></a>
      <a href='./Autopayment' className='links' id='autopayment'><MdAutorenew /></a>
      <a href='#' className='links' id='Calendar'><MdOutlineEditCalendar /></a>
      <a href='#' className='links' id='noti'><IoIosNotifications /></a>
      <a href='#' className='links' id='sett'><AiFillSetting /></a>

    </div>
  );
}

export async function links() {
  const homepage = document.getElementById('homepage');
  homepage.onclick = async () => {
    <Home />
  };
  const history = document.getElementById('history');
  history.onclick = async () => {
    document.location.replace('./Statistics');
  };
  const autopayment = document.getElementById('autopayment');
  autopayment.onclick = async () => {
    document.location.replace('./Autopayment');
  };
  
}

// export default Menu;