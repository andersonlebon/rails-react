import { createStore, applyMiddleware, combineReducers } from "redux";
import thunk from 'redux-thunk'
import { composeWithDevTools } from 'redux-devtools-extension'
import greetingReducer from './reducers/greetingReducer'


export default function configureStore(){
  const store = createStore(greetingReducer, composeWithDevTools(applyMiddleware(thunk)));
  return store;
}