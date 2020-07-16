import { StatusBar } from 'expo-status-bar';
import React from 'react';
import { View } from 'react-native';

import styles from './global';
//import Routes from './src/routes';
import SearchPage from './src/pages/Search';

export default function App() {
  return (
    <View style={styles.container}>
      <SearchPage></SearchPage>
    </View>
  );
}

