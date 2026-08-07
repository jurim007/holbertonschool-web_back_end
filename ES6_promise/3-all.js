import { uploadPhoto, createUser } from './utils';

export default function handleProfileSignup() {
  return Promise.all([uploadPhoto(), createUser()])
    .then(([photo, user]) => {
      console.log(`${photo.body} ${user.firstName} ${user.lastName}`);
    })
    .catch(() => {
      console.log('Signup system offline');
    });
}
//Pritja e dy proceseve: Me Promise.all(), 
// kodi ekzekutoi njëkohësisht dy funksione asinkrone (uploadPhoto dhe createUser).

//Nxjerrja e rezultatit: Pasi të dyja përfunduan me sukses, 
// kodi mori të dhënat nga të dyja dhe i printoi në një rresht të vetëm: photo-profile-1 Guillaume Salva.

//Trajtimi i gabimit: Nëse ndonjëra nga ftesat dështon,
//  blloku .catch() kap gabimin dhe afishon mesazhin "Signup system offline".