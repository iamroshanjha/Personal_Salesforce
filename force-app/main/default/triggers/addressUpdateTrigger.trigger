trigger addressUpdateTrigger on Account (before update, after update) {
    System.debug('updating...');
}