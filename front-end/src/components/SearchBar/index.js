import React, { useRef } from 'react';
import { Button, View } from 'react-native';
import { Form } from '@unform/mobile';
import Input from './input/input';
import { FontAwesome } from '@expo/vector-icons'
import styles from './input/style';

//import Search from '../../../../back-end/Controllers/SearchController/Search'


export default function SearchBar() {
  const formRef = useRef(null);
  function handleSubmit(data) {
    console.log(data);
    
  }
  
  
  //console.log(await Search(1234))

  return (
    <Form ref={formRef} onSubmit={handleSubmit}>    
      <View style = {{
          flex: 1,
          flexDirection: 'row',
          justifyContent: 'center'
        }}>
          
        <View style = {{width: '90%',height: 50}}>
          <Input name="game" type="string" />
          
          <View style = {{alignSelf: 'center'}}>
            <FontAwesome 
              name="search" 
              size={30} 
              color="#F21B3F" 
              onPress={() => formRef.current.submitForm()}
            />
          </View>
        </View>

      </View>
    </Form>
  );
}
/*
      <View style = {{
          flex: 1,
          flexDirection: 'ROW',
          justifyContent: 'center'
        
        }}>
          < View style = {{width: 50,height: 50,backgroundColor: 'steelblue'}}>
            <Input name="game" type="string" />
          </View>

          <View style = {{width: 50,height: 50,backgroundColor: 'powderblue'}}>
            <FontAwesome 
              name="search" 
              size={30} 
              color="#F21B3F" 
              onPress={() => formRef.current.submitForm()}
            />
          </View>
      </View>
*/