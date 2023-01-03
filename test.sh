          - "#!/bin/bash\n/opt/aws/bin/cfn-init -v --stack ${AWS::StackName} --resource\
            \ ReplicaNodeInstance  --region ${AWS::Region}\nmkdir -p /home/ec2-user/mongodb\
            \ \ncd /home/ec2-user/mongodb \naws s3 cp s3://${Param1}/${QSS3KeyPrefix}scripts/orchestrator.sh\
            \ orchestrator.sh --region ${Param2}\nchmod +x orchestrator.sh \naws s3\
            \ cp s3://${Param1}/${QSS3KeyPrefix}scripts/disable-transparent-hugepages\
            \ /etc/init.d/disable-transparent-hugepages --region ${Param2}\nchmod\
            \ +x /etc/init.d/disable-transparent-hugepages \nchkconfig --add disable-transparent-hugepages\
            \ \naws s3 cp s3://${Param1}/${QSS3KeyPrefix}scripts/init_replica.sh init.sh\
            \ --region ${Param2}\naws s3 cp s3://${Param1}/${QSS3KeyPrefix}scripts/signalFinalStatus.sh\
            \ signalFinalStatus.sh --region ${Param2}\nchmod +x signalFinalStatus.sh\
            \ \nchmod +x init.sh \n#  Run the install \n#  Store stack name to tag\
            \ DDB name\necho ${Param3} >> config.sh\necho ${Param4} >> config.sh\n\
            echo ${Param5} >> config.sh\n#  Store WaitHandler\necho ${Param6} >> config.sh\n\
            echo ${Param7} >> config.sh\nmkdir -p /mongo_auth \n./init.sh > install.log\
            \ 2>&1 \n#  Cleanup \n#rm -rf *\nchown -R ec2-user:ec2-user /home/ec2-user/\
            \ \n/home/ec2-user/mongodb/signalFinalStatus.sh 0\n"
