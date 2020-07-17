
import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { View, Text } from 'react-native';
import { createStackNavigator } from '@react-navigation/stack';

import List from './pages/List/index'
import Details from './pages/Details/index'
import SearchPage from './pages/Search/index'



const Stack = createStackNavigator();

const Routes = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator initialRouteName='SearchPage'>
        <Stack.Screen name="SearchPage" component={SearchPage} />
        <Stack.Screen name="List" component={List} />
        <Stack.Screen name="Details" component={Details} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default Routes;