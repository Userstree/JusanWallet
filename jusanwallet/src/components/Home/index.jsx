import './home.css';
// import { Card } from '../Card';
// import { ReactComponent as Logo } from './jusan-logo.svg';
// import { ReactComponent as Jmart } from './jmart2.svg';
import { Autopayment } from "../Autopayment";

import * as React from 'react';
import { experimentalStyled as styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid';

import List from '@mui/material/List';
import ListItem from '@mui/material/ListItem';
import ListItemAvatar from '@mui/material/ListItemAvatar';
import ListItemText from '@mui/material/ListItemText';
import Avatar from '@mui/material/Avatar';
// import FolderIcon from '@mui/icons-material/Folder';

function generate(element) {
  return [0, 1, 2].map((value) =>
    React.cloneElement(element, {
      key: value,
    }),
  );
}

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(2),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

export function Home() {
  return (
    <div className='Home'>
      <div className='header'>
        <p className='title'>JUSAN</p>
        <p>
          $14 000{' '}
          <select>
            <option>KZT</option>
            <option>USD</option>
            <option>EUR</option>
          </select>
        </p>

        <Box sx={{ flexGrow: 1 }}>
          <Grid
            container
            spacing={{ xs: 2, md: 3 }}
            columns={{ xs: 4, sm: 8, md: 12 }}
          >
            <Grid  item xs={2} sm={4} md={4}>
              <Item>
                JUSAN Invest
              </Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
              <Item>
                J-mart
              </Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
              <Item>
                JUSAN Garant
              </Item>
            </Grid>
            <Grid item xs={2} sm={4} md={4}>
              <Item>
                J-mart
              </Item>
            </Grid>
          </Grid>
        </Box>
      </div>
      <div className='table'>
      <List>
              {generate(
                <ListItem>
                  <ListItemAvatar>
                    <Avatar>
                      {/* <FolderIcon /> */}
                    </Avatar>
                  </ListItemAvatar>
                  <ListItemText
                    primary="Single-line item"
                  />
                </ListItem>,
              )}
            </List>
      </div>
      <Autopayment />
    </div>
  );
}
