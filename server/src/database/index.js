import {Sequelize} from 'sequelize'
import config from '../config/database.js'

const sequelize = Sequelize(config)

try{
  sequelize.authenticate()
  console.log("Autenticado com sucesso")
} catch(err){
  console.log(err)
}
