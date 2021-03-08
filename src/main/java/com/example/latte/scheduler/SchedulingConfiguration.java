package com.example.latte.scheduler;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class SchedulingConfiguration {

	 @Autowired
	  private Scheduler scheduler;

	  @PostConstruct
	  public void start() {
	      log.info("JobController start invoked");
	      try {
	        JobDetail jobDetail = buildJobDetail(ResetTodayCntJob.class, "resetTodayCntJob", "00시 기점으로 todayCnt가 0으로 리셋", new HashMap<String, Object>());

	        //이미 스케쥴이 DB에 등록되어 있다면 삭제
	        if (scheduler.checkExists(jobDetail.getKey())) {
	          scheduler.deleteJob(jobDetail.getKey());
	        }

	        //Job과 트리거를 설정, 
	        scheduler.scheduleJob(jobDetail, buildCronJobTrigger("0 0 0 * * ?"));
	      } catch (SchedulerException e) {
	          e.printStackTrace();
	      }
	  }

	  // *  *   *   *   *   *     *
	  //초  분  시  일  월  요일  년도(생략가능)
	  public Trigger buildCronJobTrigger(String scheduleExp) {
	      return TriggerBuilder.newTrigger()
	        .withSchedule(CronScheduleBuilder.cronSchedule(scheduleExp))
	        .build();
	  }

	  // 매개변수로 입력받은 시간단위로 실행 
	  public Trigger buildSimpleJobTrigger(Integer hour) {
	    return TriggerBuilder.newTrigger()
	      .withSchedule(SimpleScheduleBuilder
	        .simpleSchedule()
	        .repeatForever()
	        .withIntervalInHours(hour))
	      .build();
	  }

	  public JobDetail buildJobDetail(Class job, String name, String desc, Map<String, Object> params) {
	    JobDataMap jobDataMap = new JobDataMap();
	    jobDataMap.putAll(params);
	    return JobBuilder.newJob(job).withIdentity(name).withDescription(desc).usingJobData(jobDataMap).build();
	  }
}
