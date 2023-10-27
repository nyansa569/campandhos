const url = 'http://localhost:1101/api/users';
const register = '$url/register';
const login = '$url/login';
const urlHostel = 'http://localhost:1101/api/location';
const allHostels = '$urlHostel/getHostels';
const singleHostel = '$urlHostel/getHostel/';
const allRooms = '$urlHostel/getRooms/';
const singleRoom = '$urlHostel/getRoom/';
const booking = 'http://localhost:1101/api/booking';
const tokenCode =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NGVlMWZkNzExOWM4OWMzY2U1YjU4NWQiLCJpbmRleCI6IjAyIiwic3R1ZGVudE5hbWUiOiJLb2pvIiwic2Nob29sIjoiR1RVQyIsImNvdXJzZSI6IkNvbXB1dGVyIEVuZ2luZWVyaW5nIiwiaWF0IjoxNjkzMzI3NDY5LCJleHAiOjE2OTMzMjkyNjl9.phAAb9BO93M4KGK73jHCtvOxBN5MJyyGJ9IKKZcULuQ';

const allNews = 'http://localhost:1101/api/news';
const currentUser = '$url/current';
const locations = 'http://localhost:1101/api/admin/locations';
