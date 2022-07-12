import './menu.css';
import { AiFillHome, AiOutlineHistory, AiFillSetting } from 'react-icons/ai';
import { IoIosNotifications } from 'react-icons/io';
import { MdOutlineEditCalendar, MdAutorenew } from 'react-icons/md';
import { Home } from '../Home';
import { Autopayment } from '../Autopayment';
import React from 'react';
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Link,
  useParams,
  useRouteMatch,
} from 'react-router-dom';

export function Menu() {
  return (
      <div className='Menu'>
      {/*    <Link className='active' to='/'>
           <AiFillHome />
         </Link>
         <Link className='links' id='autopayment' to='/autopayment'>
           <MdAutorenew />
         </Link>
         <Link className='links' to='/Noti'>
           <IoIosNotifications />
         </Link>
         <Link className='links' to='/Settings'>
           <AiFillSetting />
         </Link>  */}

        <a className='active' id='homepage' href='./'>
         <AiFillHome/>
       </a>
       <a href='/statistics'id='history'><AiOutlineHistory /></a>
       <a href='./autopayment' id='autopayment'><MdAutorenew /></a>
       <a href='#' id='Calendar'><MdOutlineEditCalendar /></a>
       <a href='#' id='noti'><IoIosNotifications /></a>
       <a href='#' id='sett'><AiFillSetting /></a> 

      </div>

  );
}
