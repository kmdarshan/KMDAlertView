# KMDAlertView
Custom alert view with background blacked out and easy to use delegate methods

Using this alert view<br><br>

```obj-c
    KMDAlert *alert = [[KMDAlert alloc] initWithFrame:self.view.frame title:@"Information" message:@"You need to fill up the email correctly." ok:@"OK" cancel:@"Cancel"];
    [alert setAlertTag:1];
    [alert setDelegate:self];
    [self.view addSubview:alert];
   ```
Implement the delegate method<br>
```obj-c
    -(void)clickButtonAtIndex:(NSInteger)index buttonWithTag:(NSInteger)tag {
   	NSLog(@"tag %lu index %lu ", tag, index);
  ```
