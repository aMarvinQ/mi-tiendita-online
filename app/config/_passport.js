import passport from 'passport';
import { Strategy as JwtStrategy, ExtractJwt } from 'passport-jwt';
import userModel from '../models/User.js';
import dotenv from 'dotenv';

dotenv.config();

const opts = {
    jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
    secretOrKey: process.env.JWT_SECRET
};

passport.use(new JwtStrategy(opts, async (jwtPayload, done) => {
    try {
        const user = await userModel.findByPk(jwtPayload.idUsuarios);
        if (user) {
            return done(null, user);
        }
        return done(null, false);
    } catch (err) {
        return done(err, false);
    }
}));

export default passport;
