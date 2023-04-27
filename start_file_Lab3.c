/* the callback needs to be executed with every TS seconds, in this example 0.01 seconds
 * => fs = 100 [hz]
 */
#define TS        0.01
/* Battery voltage, assuming it’s constant */
#define VBATT     8.0
/* macros to convert from voltage to duty cycle and vice-versa, assuming linear
 * relationship between the two
 */
#define V2DUTY    ((float)(TIM8_ARR_VALUE + 1) / VBATT)
#define DUTY2V    ((float)VBATT / (TIM8_ARR_VALUE + 1))

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    uint32_t TIM3_CurrentCount;
    int32_t TIM3_DiffCount;
    static uint32_t TIM3_PreviousCount = 0,

    TIM3_CurrentCount = __HAL_TIM_GET_COUNTER(&htim3);

    /*  evaluate increment of TIM3 counter from previous count  */
    if (__HAL_TIM_IS_TIM_COUNTING_DOWN(&htim3)) 
    {
        /* check for counter underflow */
        if (TIM3_CurrentCount <= TIM3_PreviousCount)
            TIM3_DiffCount = TIM3_CurrentCount - TIM3_PreviousCount;
        else
            TIM3_DiffCount = -((TIM3_ARR_VALUE+1) - TIM3_CurrentCount) - TIM3_PreviousCount;
    }
    else
    { 
    /* check for counter overflow */
        if (TIM3_CurrentCount >= TIM3_PreviousCount)
            TIM3_DiffCount = TIM3_CurrentCount - TIM3_PreviousCount;
        else
            TIM3_DiffCount = ((TIM3_ARR_VALUE+1) - TIM3_PreviousCount) + TIM3_CurrentCount;
    }

    TIM3_PreviousCount = TIM3_CurrentCount;


    // comand a motor
    uint32_t duty;
    /* calculate duty properly */
    if (duty <= 0) { // rotate forward
        /* alternate between forward and coast __HAL_TIM_SET_COMPARE(&htim8, TIM_CHANNEL_1, (uint32_t)duty); __HAL_TIM_SET_COMPARE(&htim8, TIM_CHANNEL_2, 0);
        /* alternate between forward and brake, TIM8_ARR_VALUE is a define
        * __HAL_TIM_SET_COMPARE(&htim8, TIM_CHANNEL_1, (uint32_t)TIM8_ARR_VALUE);
            * __HAL_TIM_SET_COMPARE(&htim8, TIM_CHANNEL_2, TIM8_ARR_VALUE - duty);
            */
    } else { // rotate backward
        __HAL_TIM_SET_COMPARE(&htim8, TIM_CHANNEL_1, 0); 
        __HAL_TIM_SET_COMPARE(&htim8, TIM_CHANNEL_2, (uint32_t)-duty);
    }
    //command a motor



    if(htim->Instance == TIM6) { /*
    * 1. read the counter value from the encoder
    * 2. compute the difference between the current value and the old value
    * 3. compute the motor speed, in [rpm] for example
    * 4. compute the tracking error
    * 5. compute the proportional term
    * 6. compute the integral term (simplest way is to use forward Euler method) * u_int=u_int+Ki*TS*err
    * 7. calculate the PI signal and set the pwm of the motor properly
    */
    } 
}
void main(void)
{
    while (1) {
    /* low priority actions */
    } 
}