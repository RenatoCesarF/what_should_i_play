import React from 'react'
import {View} from 'react-native'
import {TextInput} from 'react-native-paper'
import styles from './style'

const SearchBar = () => {
    const [text] = React.useState('');
  
    return (
      <TextInput
        style={styles.areaPesquisa}
        label="Jogo"
        value={text}
        //onChangeText={text => setText(text)}
      />
    );
};

export default SearchBar;