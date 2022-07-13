import './home.css';
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

import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';

function generate(element) {
  return [0, 1, 2].map((value) =>
    React.cloneElement(element, {
      key: value,
    })
  );
}

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fd6900',
  ...theme.typography.body2,
  padding: theme.spacing(2),
  textAlign: 'center',
  color: '#fafafa',
}));

export function Home() {
  return (
    <div className='Home'>
      <div className='card'>
      <Card sx={{ display: 'flex' }}>
        <Box sx={{ display: 'flex', flexDirection: 'column' }}>
          <CardContent sx={{ flex: '0.5 0.5 auto' }}>
            <Typography component='div' variant='h6' color='orange'>
              Jusan
            </Typography>
            <Typography component='div' variant='h5'>
              2 444 550 000
            </Typography>
            <Typography
              variant='subtitle1'
              color='text.secondary'
              component='div'
            >
              KZT
              {/* <select>
            <option>KZT</option>
            <option>USD</option>
            <option>EUR</option>
          </select> */}
            </Typography>
          </CardContent>
        </Box>
      </Card>
      </div>
<div className='category'>
      <Box sx={{ flexGrow: 1 }}>
        <Grid
          container
          spacing={{ xs: 2, md: 3 }}
          columns={{ xs: 4, sm: 8, md: 12 }}
        >
          <Grid item xs={2} sm={4} md={4}>
            <Item>JUSAN Invest</Item>
          </Grid>
          <Grid item xs={2} sm={4} md={4}>
            <Item className='active'>J-mart</Item>
          </Grid>
          <Grid item xs={2} sm={4} md={4}>
            <Item>JUSAN Garant</Item>
          </Grid>
          <Grid item xs={2} sm={4} md={4}>
            <Item>J-mart</Item>
          </Grid>
        </Grid>
      </Box>

      <div className='table'>
        <List>
          {generate(
            <ListItem>
              <ListItemAvatar>
                <Avatar>{/* <FolderIcon /> */}</Avatar>
              </ListItemAvatar>
              <ListItemText primary='Starbucks' />
            </ListItem>
          )}
        </List>
      </div>
    </div>
    </div>
  );
}
