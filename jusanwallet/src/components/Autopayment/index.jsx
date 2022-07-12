import '../../App.css';
import {Menu} from '../Menu';

import * as React from 'react';
import Box from '@mui/material/Box';
import Grid from '@mui/material/Grid';
import { experimentalStyled as styled } from '@mui/material/styles';
import Paper from '@mui/material/Paper';
import { Button } from '@mui/material';

const Item = styled(Paper)(({ theme }) => ({
    backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
    ...theme.typography.body2,
    padding: theme.spacing(2),
    textAlign: 'center',
    color: theme.palette.text.secondary,
  }));

export function Autopayment() {

  return (
    <div className='Autopayment'>
      <Menu />
      <div className='content'>
      <Box sx={{ flexGrow: 1 }}>
          <Grid
            container
            spacing={{ xs: 2, md: 3 }}
            columns={{ xs: 4, sm: 8, md: 12 }}
          >
            <Grid  item xs={2} sm={4} md={4}>
            <Button> date </Button> <Button> period </Button> 
             <Item>
                Tele-2
              </Item>
              
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
            <Button> date </Button> <Button> period </Button> 
              <Item>
                KinderGarden
              </Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
            <Button> date </Button> <Button> period </Button> 
              <Item>
                Credit
              </Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
            <Button> date </Button> <Button> period </Button> 
              <Item>
                Kommunalnye uslugi
              </Item>
            </Grid>
          </Grid>
        </Box>
      </div>
    </div>
  );
}
