trigger AccountInsert on Account (before Insert) {
    System.Debug('Size '+Trigger.new.Size());
    customerTrigger.AccountTriggertest(Trigger.New);
    Map<String, Object> params = new Map<String, Object>();
    Flow.Interview.test yourFlow = new Flow.Interview.test(params);
    yourFlow.start();
}