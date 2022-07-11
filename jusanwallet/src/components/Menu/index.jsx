import './menu.css';
import { AiFillHome, AiOutlineHistory, AiFillContacts, AiFillSetting } from 'react-icons/ai';
import { SiContactlesspayment } from 'react-icons/si';
import { IoIosNotifications } from 'react-icons/io';
import { CgProfile } from 'react-icons/cg';


export function Menu() {
  return (
    <div className='Menu'>
      <a className='active' href='#home'>
        <AiFillHome/>
      </a>
      <a href='#history'><AiOutlineHistory /></a>
      <a href='#auto'><SiContactlesspayment /></a>
      <a href='#contact'><AiFillContacts /></a>
      <a href='#contact'><IoIosNotifications /></a>
      <a href='#contact'><CgProfile /></a>
      <a href='#contact'><AiFillSetting /></a>

    </div>
  );
}

// export default Menu;
