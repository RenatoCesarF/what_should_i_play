import React, { useEffect, useRef} from 'react' 
import {useField} from '@unform/core';
import {TextInput, View} from 'react-native'
import { FontAwesome } from '@expo/vector-icons'; 

import styles from './style'

export default function Input({name}) {
    const inputRef = useRef(null);
    const { fieldName,registerField, error, defaultValue} = useField(name);

    useEffect(() => {
        console.log(inputRef.current.value);
    }, [inputRef]);

    return(
        <View>
            
            <View>
                <FontAwesome name="search" size={30} color="#F21B3F"/>
            </View>

            <View>
                <FontAwesome name="remove" size={30} color="#2d2d2d"/>  
            </View>
            
            <TextInput ref={inputRef} value='sa' style={styles.areaPesquisa}/>
        </View>
    )
}