import './App.css';
import { Main } from './components/Main';
import { Autopayment } from './components/Autopayment';
import { Statistics } from './components/Statistics';

import { render } from 'react-dom';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import App from './App';

const rootElement = document.getElementById('root');
render(
  <BrowserRouter>
    <Routes>
      <Route path='/' element={<Main />} />
      <Route path='autopayment' element={<Autopayment />} />
      <Route path='statistics' element={<Statistics />} />
    </Routes>
  </BrowserRouter>,
  rootElement
);

export default App;
