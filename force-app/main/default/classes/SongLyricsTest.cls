@isTest
private class SongLyricsTest {
    @isTest static void getLyricsCallout() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new SongLyricsHttpCallOutMock());
        String result = SongLyrics.getLyrics('','');
        System.assertEquals('', result);  
       	System.Test.stopTest();
    }  
    @isTest static void getLyricsCallout2() {
        System.Test.startTest();
        System.Test.setMock(HttpCalloutMock.class, new SongLyricsHttpCallOutMock2());
        String result = SongLyrics.getLyrics('','');
        System.assertEquals(null, result);  
       	System.Test.stopTest();
    }
}