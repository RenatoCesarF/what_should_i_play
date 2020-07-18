  
import styles from './style.js'


import SearchBar from '../../components/SearchBar/index'
import React from 'react';
import { View , Text,StatusBar} from 'react-native';

export default function SearchPage() {
  return (
    
    <View style={styles.container}>

     
      <Text style={styles.title}>What Should I Play?</Text>
     

      <Text style={styles.description}>
        Digite um jogo que você gostou 
        e eu te indicarei o que devia jogar agora
      </Text>
  

      <SearchBar/>

      <StatusBar style="auto" />
    </View>
  );
}
